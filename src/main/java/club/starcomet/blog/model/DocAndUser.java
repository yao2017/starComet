package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;
@Data
public class DocAndUser {
    private Integer id;
    private Integer userId;
    private Integer docId;
    private Date createTime;
    private Date updateTime;
}
