package com.nowak.dao;

import com.nowak.db_entities.Messages;

import java.util.List;

public interface MessagesDao {

    void addMessage(Messages message);
    void addMessageToUser(Messages message,String username);
    List<Messages> getMessages();
    Messages getMessagebyId(int id);
    void deleteMessage(int id);
    List<Messages> getOnlyUserMessages(String name);
}
