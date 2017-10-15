package ua.oleksandr.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.oleksandr.spring.dao.User;
import ua.oleksandr.spring.service.UserService;

import java.util.List;

@Controller
public class UserController {
    private final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    UserService userService;

    @RequestMapping(value = "/usersPage")
    public String getUsers(Model model) {
        log.debug("called /users");
//        ModelAndView mv = new ModelAndView();
//        List<User> userList = userService.getAll();
//        mv.addObject("usersList", userList);
//        mv.setViewName("users");
        return "users";
    }

    @RequestMapping(value = "/userAdd")
    public String addUser(Model model) {
        log.debug("called /user/add");
        model.addAttribute("user",new User());
        return "userAdd";
    }

//    @RequestMapping(value = "/user/{id}/edit")
//    public ModelAndView editUser(@PathVariable Long id) {
//        log.debug("called /user/{}/edit", id);
//        User user = userService.getUser(id);
//        ModelAndView modelAndView = new ModelAndView("userEdit", "user", user);
//        modelAndView.addObject("u", user);
//        return modelAndView;
//    }
//
//    @RequestMapping(value = "/user/{id}/result")
//    public ModelAndView processEditUser(User user) {
//        log.debug("called /user/id/result with {}", user);
//        userService.update(user);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("u", user);
//        modelAndView.setViewName("showUser");
//        return modelAndView;
//    }
//
//    @RequestMapping(value = "/user/result")
//    public ModelAndView processAddUser(User user) {
//        log.debug("called /user/result with {}", user);
//        userService.create(user);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("u", user);
//        modelAndView.setViewName("showUser");
//        return modelAndView;
//    }

//    @RequestMapping(value = "user/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    public ResponseEntity deleteUser(@PathVariable Long id) {
//        log.debug("called /user/{} DELETE", id);
//        boolean isDelete = userService.delete(id);
//        if (isDelete) {
//            return new ResponseEntity(HttpStatus.OK);
//        } else {
//            return new ResponseEntity(HttpStatus.NOT_FOUND);
//        }
//    }

    // --- JSON processing ---
    @RequestMapping(value = "userJson", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public User getUserJson(@RequestBody User user) {
        log.debug("user from {}", user);
        User userFromDb = userService.getUser(1L);
        return userFromDb;
    }

    //
    @RequestMapping(value = "/users", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<User> getUsersJson() {
        log.debug("called /jsonUsers");
        List<User> userList = userService.getAll();
        return userList;
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public User getUserJson(@PathVariable Long id) {
        log.debug("user Get called /user/{}/", id);

        return userService.getUser(id);
    }

    @RequestMapping(value = "/user", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public User addUserJson(@RequestBody User user) {
        log.debug("user Add called /user with user value: {}", user);
        userService.create(user);
        return user;
    }


    @RequestMapping(value = "/user/{id}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public User editUserJson(@PathVariable Long id, @RequestBody User user) {
        log.debug("user Edit called /user/{} with user value: {}", id, user);
        user.setId(id);
        userService.update(user);
        return user;
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public boolean deleteUserJson(@PathVariable Long id) {
        log.debug("user Delete called /user/{}/", id);
        boolean isDelete = userService.delete(id);
        return isDelete;

    }

}
