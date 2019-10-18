package com.nowak.dao;

import com.nowak.db_entities.Messages;

import java.util.List;

public interface MessagesDao {

    public void addMessage(Messages message);
    public List<Messages> getMessages();
}
