package com.nowak.dao;

import com.nowak.db_entities.Messages;

import java.util.List;

public interface MessagesDao {

    void addMessage(Messages message);
    List<Messages> getMessages();
    void deleteMessage(int id);
    List<Messages> getOnlyUserMessages(String name);
}
