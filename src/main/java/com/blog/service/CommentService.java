package com.blog.service;

import com.blog.model.ChildComment;
import com.blog.model.Comment;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/02
 */
public interface CommentService {


    List<Comment> findAllCommentsByAId(long aId);

    List<ChildComment> findChildCommentsByCId(Long cId);

    void addComment(Comment comment);

    void addChildComment(ChildComment childComment);
}
