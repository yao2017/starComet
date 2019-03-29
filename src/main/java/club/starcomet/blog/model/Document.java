package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;

@Data
public class Document {
    private Integer docId;

    private String docTitle;

    private String docContent;

    private String docTag;

    private String docAuthor;

    private Date createTime;

    private Date updateTime;
}
