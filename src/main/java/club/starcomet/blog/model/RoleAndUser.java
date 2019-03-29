package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;
@Data
public class RoleAndUser {
    private Integer id;
    private Integer userId;
    private Integer roleId;
    private Date createTime;
    private Date updateTime;
}
