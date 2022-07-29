package service;

public class CalculatorService {

    public static String calculate(double firstOperand, double secondOperand, String operator) {
        double result;

        String str = "";
        switch (operator) {
            case "/":
                try {
                    if(secondOperand ==0) {
                        throw new ArithmeticException("cannot be divided by 0");
                    }else {
                    result = firstOperand / secondOperand;
                        str = ""+firstOperand +operator+secondOperand  +"="+ result;
                    }
                } catch (ArithmeticException e) {
                  e.printStackTrace();
                    str = e.getMessage();
                }
                break;
            case "*":
                result = firstOperand * secondOperand;
                str = ""+firstOperand +operator+secondOperand  +"="+ result;
                break;
            case "+":
                result = firstOperand + secondOperand;
                str = ""+firstOperand +operator+secondOperand  +"="+ result;
                break;
            case "-":
                result = firstOperand - secondOperand;
                str = ""+firstOperand +operator+secondOperand  +"="+ result;
                break;
        }

        return str;
    }
}
