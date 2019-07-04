package com.blog.model;

import java.util.Date;

/**
 * @author xyq
 * @date 2019/06/29
 */
public class User {

    private Long id;

    private String email;

    private String phone;

    private String name;

    private String password;

    private String imgUrl;

    private Date updateTime;

    private Date createTime;

    private String state;

    private String admin;


    private String description;

    private String address;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                ", state='" + state + '\'' +
                ", admin='" + admin + '\'' +
                ", description='" + description + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
