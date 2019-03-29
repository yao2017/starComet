package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;
@Data
public class ComAndUser {
    private Integer id;
    private Integer userId;
    private Integer comId;
    private Date createTime;
    private Date updateTime;
}
