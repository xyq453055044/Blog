package com.blog.service.impl;

import com.blog.dao.CommentDao;
import com.blog.model.ChildComment;
import com.blog.model.Comment;
import com.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/02
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> findAllCommentsByAId(long aId) {
        return commentDao.selectAllCommentsByAId(aId);
    }

    @Override
    public List<ChildComment> findChildCommentsByCId(Long cId) {
        return commentDao.selectChildCommentsByCId(cId);
    }

    @Override
    public void addComment(Comment comment) {
        commentDao.insertComment(comment);
    }

    @Override
    public void addChildComment(ChildComment childComment) {
        commentDao.insertChildComment(childComment);
    }
}
