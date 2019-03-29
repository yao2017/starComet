package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;
@Data
public class Role {
    private Integer rolesId;
    private Integer roleName;
    private String role;
    private Date createTime;
}
