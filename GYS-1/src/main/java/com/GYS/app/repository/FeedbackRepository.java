package com.GYS.app.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GYS.app.model.Feedback;
import com.GYS.app.model.User;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

	public List<Feedback> findByContactDateBetween(Date fromDate,Date toDate);


}

