package com.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.PostDAO;
import com.DAO.TagDAO;
import com.model.PostModel;
import com.model.TagModel;

public class CreatePostService {

    // method to validate post with image
	public String validatePost(PostModel post, String tag) throws SQLException {

	    // community — REQUIRED
	    if (post.getCommunityId() <= 0) {
	        return "Please select a community.";
	    }

	    // user session — REQUIRED
	    if (post.getUserId() <= 0) {
	        return "User session expired. Please log in again.";
	    }

	    // image — REQUIRED
	    if (post.getPostImage() == null || post.getPostImage().length == 0) {
	        return "Post image is required.";
	    }
	    if (post.getPostImage().length > 5 * 1024 * 1024) {
	        return "Image must not exceed 5MB.";
	    }

	    // caption — OPTIONAL, validate length only if provided
	    String caption = post.getCaption();
	    if (caption != null && !caption.trim().isEmpty()) {
	        if (caption.trim().length() < 3) {
	            return "Caption must be at least 3 characters.";
	        }
	        if (caption.trim().length() > 250) {
	            return "Caption must not exceed 250 characters.";
	        }
	    }

	    // tags — OPTIONAL, validate length only if provided
	    if (tag != null && !tag.trim().isEmpty()) {
	        if (tag.trim().length() > 200) {
	            return "Tags must not exceed 200 characters.";
	        }
	    }

	    // insert post — get generated postId
	    PostDAO postDAO = new PostDAO();
	    int postId = postDAO.createPost(post);
	    if (postId == -1) {
	        return "Failed to create post. Please try again.";
	    }

	    // parse and insert tags if provided
	    if (tag != null && !tag.trim().isEmpty()) {
	        List<TagModel> tags = parseTags(postId, tag);
	        TagDAO tagDAO = new TagDAO();
	        for (TagModel t : tags) {
	            tagDAO.insertTag(t);
	        }
	    }

	    return null;
	}
	
	// method to validate post with no image
	public String validateTextPost(PostModel post, String tag) throws SQLException {

	    // caption — REQUIRED
	    if (post.getCaption() == null || post.getCaption().trim().isEmpty()) {
	        return "Caption is required.";
	    }
	    if (post.getCaption().trim().length() < 3) {
	        return "Caption must be at least 3 characters.";
	    }
	    if (post.getCaption().trim().length() > 500) {
	        return "Caption must not exceed 500 characters.";
	    }

	    // community — REQUIRED
	    if (post.getCommunityId() <= 0) {
	        return "Please select a community.";
	    }

	    // user session — REQUIRED
	    if (post.getUserId() <= 0) {
	        return "User session expired. Please log in again.";
	    }

	    // tags — OPTIONAL, validate length only if provided
	    if (tag != null && !tag.trim().isEmpty()) {
	        if (tag.trim().length() > 200) {
	            return "Tags must not exceed 200 characters.";
	        }
	    }

	    // insert post
	    PostDAO postDAO = new PostDAO();
	    int postId = postDAO.createPost(post);
	    if (postId == -1) {
	        return "Failed to create post. Please try again.";
	    }

	    // insert tags if provided
	    if (tag != null && !tag.trim().isEmpty()) {
	        List<TagModel> tags = parseTags(postId, tag);
	        TagDAO tagDAO = new TagDAO();
	        for (TagModel t : tags) {
	            tagDAO.insertTag(t);
	        }
	    }

	    return null;
	}

    public List<TagModel> parseTags(int postId, String tagInput) {
        List<TagModel> tags = new ArrayList<>();

        if (tagInput == null || tagInput.trim().isEmpty()) {
            return tags;
        }

        String[] parts = tagInput.trim().split("\\s+");

        for (String part : parts) {
            String tagName = part.startsWith("#") ? part.substring(1) : part;
            if (!tagName.isEmpty()) {
                TagModel tag = new TagModel();
                tag.setName(tagName);
                tag.setPostId(postId);
                tags.add(tag);
            }
        }

        return tags;
    }
}