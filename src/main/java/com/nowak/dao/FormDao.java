package com.nowak.dao;

import com.nowak.db_entities.Forms;

import java.util.List;

public interface FormDao {

    List<Forms> getForms();
    List<Forms> getOnlyUserForms(String name);
    void addForm(Forms form);
    void deleteForm(int id);
}
