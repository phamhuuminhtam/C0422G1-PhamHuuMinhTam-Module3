import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet", value = "/translate")
public class DictionaryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Map<String,String>  dictionary = new HashMap<>();
        dictionary.put("hello", "xin chào");
        dictionary.put("how", "như thế nào");
        dictionary.put("book", "cuốn sách");
        dictionary.put("computer", "máy tính");
        dictionary.put("bike", "xe máy");
        dictionary.put("bye", "tạm biệt");
        dictionary.put("good", "tốt");
        String search = request.getParameter("txtSearch");

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        String result = dictionary.get(search);
        if(result!=null){

            request.setAttribute("translate", result);
            request.setAttribute("word", search);

        }else {
            result = " Không tìm thấy";
            request.setAttribute("word",result );
        }
        requestDispatcher.forward(request,response);
    }

}
