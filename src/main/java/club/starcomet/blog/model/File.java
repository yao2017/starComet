package club.starcomet.blog.model;

import lombok.Data;

import java.util.Date;

@Data
public class File {
    private Integer fileId;

    private Integer fileType;

    private String fileUrl;

    private Date createTime;

    private Date updateTime;
}
