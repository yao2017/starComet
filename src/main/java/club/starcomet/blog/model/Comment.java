package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;
@Data
public class Comment {

    private Integer comId;

    private String comTag;

    private String comContent;

    private Date createTime;
}
