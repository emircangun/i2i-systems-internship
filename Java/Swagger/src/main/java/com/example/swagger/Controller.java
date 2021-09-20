package com.example.swagger;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @RequestMapping(value = "/send-data", method = RequestMethod.POST)
    public String sendData(Integer from, Integer to, Integer duration, String location)
    {
        return new String("A data sent from " + from + " to " + to + " for " + duration + "minutes in " + location);
    }

    @RequestMapping(value = "/send-sms", method = RequestMethod.POST)
    public String sendSms(Integer from, Integer to, String location)
    {
        return new String("A sms sent from " + from + " to " + to + " in " + location);
    }

    @RequestMapping(value = "/send-voice", method = RequestMethod.POST)
    public String sendVoice(Integer from, Integer mb, String ratingGroup, String location)
    {
        return new String("A voice sent from " + from + " " + mb + " " + ratingGroup + " " + location);
    }
}
