package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;
@Data
public class FileAndUser {
    private Integer id;
    private Integer userId;
    private Integer fileId;
    private Date createTime;
    private Date updateTime;
}
