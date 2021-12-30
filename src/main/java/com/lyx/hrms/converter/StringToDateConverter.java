package com.lyx.hrms.converter;

import com.sun.xml.internal.ws.model.RuntimeModelerException;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 */
@Component
public class StringToDateConverter implements Converter<String,Date>{
    @Override
    public Date convert(String s) {
        s=s.replace('T',' ');
        if (s!=null && s!=""){
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date=null;
            try {
                date=simpleDateFormat.parse(s);
            } catch (ParseException e) {
                throw new RuntimeModelerException("日期转换出错");
            }
            return date;
        }
        return null;
    }
}
