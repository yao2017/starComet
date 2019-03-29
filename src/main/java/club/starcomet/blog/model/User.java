package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;

@Data
public class User {

    private Integer userId;

    private String userName;

    private String userAccount;

    private String userPwd;

    private String userHead;

    private Integer userRole;

    private Date createTime;

}
