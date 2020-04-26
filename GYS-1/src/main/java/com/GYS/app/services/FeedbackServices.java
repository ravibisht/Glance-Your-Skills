package com.GYS.app.services;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.GYS.app.model.Feedback;
import com.GYS.app.model.User;

public interface FeedbackServices {
	
	public void saveFeedback(Feedback feedback);
	public Feedback getFeedback(int id);
	public List<Feedback> getFeedbacks();
	public Feedback getfeedback(int id);
	public void deleteFeedbackById(int id);
	public Page<Feedback> showFeedbackByPage(Pageable pageable);
	public Long countAllFeedbacks();
	public List<Feedback> findFeedbackByFromDateToDate(Date fromDate,Date toDate);

}
