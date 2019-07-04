package com.blog.dao;


import com.blog.model.ChildComment;
import com.blog.model.Comment;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/02
 */
public interface CommentDao {


    List<Comment> selectAllCommentsByAId(long aId);

    List<ChildComment> selectChildCommentsByCId(Long cId);

    void insertComment(Comment comment);

    void insertChildComment(ChildComment childComment);
}
