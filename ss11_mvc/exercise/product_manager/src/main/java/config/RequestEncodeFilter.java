package config;

import javax.servlet.*;
import java.io.IOException;
import java.util.logging.Filter;
import java.util.logging.LogRecord;


/**
     * This filter can be used to set the content type as UTF-8.
     *
     * @author SANTHOSH REDDY MANDADI
     * @version 1.0
     * @since 20th April 2008
     */

    public class RequestEncodeFilter implements Filter {

        private String encoding;

        public void init(FilterConfig config) throws ServletException {
            encoding = config.getInitParameter("requestEncoding");
            if (encoding == null) encoding = "UTF-8";
        }

        public void doFilter(ServletRequest request, ServletResponse response, FilterChain next)
                throws IOException, ServletException {
            // Respect the client-specified character encoding
            // (see HTTP specification section 3.4.1)
            if (null == request.getCharacterEncoding()) {
                request.setCharacterEncoding(encoding);
            }

            // Set the default response content type and encoding
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");

            next.doFilter(request, response);
        }

        public void destroy() {
        }

    @Override
    public boolean isLoggable(LogRecord record) {
        return false;
    }
}


