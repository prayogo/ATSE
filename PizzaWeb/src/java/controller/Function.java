package controller;

public class Function {
    
    public boolean isAlphaNumber(String _input){
        boolean alpha = false, number = false, acc = true;
        
        for(int i = 0; i < _input.length(); i++){            
            if(!Character.isAlphabetic(_input.charAt(i)) && !Character.isDigit(_input.charAt(i))){
                acc = false;
                break;
            }
            else if(Character.isAlphabetic(_input.charAt(i))){
                alpha = true;
            }
            else if(Character.isDigit(_input.charAt(i))){
                number = true;
            }
        }
        if(!(alpha && number && acc))
            return false;
        
        return true;
    }
    
    public boolean isAlpha(String _input){
        boolean alpha = true;
        
        if(_input.equals(""))
            alpha = false;
        
        for(int i = 0; i < _input.length(); i++){
            int code = (int)_input.charAt(i);
            if(!Character.isAlphabetic(_input.charAt(i)) && code != 32){
                alpha = false;
                break;
            }
        }        
        return alpha;
    }
    
    public boolean isNumeric(String _input){
        boolean numeric = true;
        
        if(_input.equals(""))
            numeric = false;
        
        for(int i = 0; i < _input.length(); i++){
            if(!Character.isDigit(_input.charAt(i))){
                numeric = false;
                break;
            }
        }        
        return numeric;
    }
    
    public boolean emailFormat(String _email){        
        boolean emailFormat = true;
        
        if(_email.equals("")){
            emailFormat = false;
        }
        else if(_email.indexOf("@") == -1 && _email.indexOf(".") == -1){//cek ada @ sama .
            emailFormat = false;
        }
        else if(_email.indexOf("@") == 0 || _email.indexOf(".") == 0){//cek ada @ sama . ada di huruf pertama
            emailFormat = false;
        }
        else if(_email.indexOf("@") == _email.length() - 1  && _email.indexOf(".") == _email.length() - 1){//cek ada @ sama . ada di huruf terakhir
            emailFormat = false;
        }
        else if(_email.indexOf("@") > _email.indexOf(".")){//cek @ di belakang .
            emailFormat = false;
        }
        else if(_email.indexOf("@") - _email.indexOf(".") == -1 || _email.indexOf("@") - _email.indexOf(".") == 1 ){//cek '@' pas 1 huruf di depan/belakang '.' 
            emailFormat = false;
        }
        
        return emailFormat;
    }
}
