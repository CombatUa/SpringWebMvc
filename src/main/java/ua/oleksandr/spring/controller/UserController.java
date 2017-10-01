package ua.oleksandr.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ua.oleksandr.spring.dao.User;
import ua.oleksandr.spring.service.UserService;

import java.util.List;

@Controller
public class UserController {
    private final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    UserService userService;

    @RequestMapping(value = "/users")
    public ModelAndView getUsers() {
        log.debug("called /users");
        ModelAndView mv = new ModelAndView();
        List<User> userList = userService.getAll();
        mv.addObject("usersList", userList);
        mv.setViewName("users");
        return mv;
    }

    @RequestMapping(value = "/user/add")
    public ModelAndView addUser() {
        log.debug("called /user/add");
        return new ModelAndView("userAdd", "user", new User());
    }

    @RequestMapping(value = "/user/{id}/edit")
    public ModelAndView editUser(@PathVariable Long id) {
        log.debug("called /user/{}/edit", id);
        User user = userService.getUser(id);
        ModelAndView modelAndView = new ModelAndView("userEdit", "user", user);
        modelAndView.addObject("u", user);
        return modelAndView;
    }

    @RequestMapping(value = "/user/{id}/result")
    public ModelAndView processEditUser(User user) {
        log.debug("called /user/id/result with {}", user);
        userService.update(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("u", user);
        modelAndView.setViewName("showUser");
        return modelAndView;
    }

    @RequestMapping(value = "/user/result")
    public ModelAndView processAddUser(User user) {
        log.debug("called /user/result with {}", user);
        userService.create(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("u", user);
        modelAndView.setViewName("showUser");
        return modelAndView;
    }

    @RequestMapping(value = "user/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ResponseEntity deleteUser(@PathVariable Long id) {
        log.debug("called /user/{} DELETE", id);
        boolean isDelete = userService.delete(id);
        if (isDelete) {
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }


    }
}
