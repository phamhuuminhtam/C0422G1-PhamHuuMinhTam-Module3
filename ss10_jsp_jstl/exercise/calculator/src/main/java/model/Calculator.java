package model;

public class Calculator {

    public static String calculate(double firstOperand, double secondOperand, String operator) {
        double result;

        String str = "";
        switch (operator) {
            case "/":
                try {
                    if(secondOperand ==0) {
                        result =1/0;
                    }else {
                    result = firstOperand / secondOperand;
                        str = ""+firstOperand +operator+secondOperand  +"="+ result;
                    }
                } catch (ArithmeticException e) {
                  e.printStackTrace();
                    str = "Không thể chia cho 0";
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
