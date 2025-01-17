﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuiz.entity
{
    public class User
    {
        private int id;
        private String name;
        private String password;
        private int role;
        private String createdDate;
        private String email;

        public User()
        {
        }

        public User(int id, String name, String password, int role, String createdDate, String email)
        {
            this.id = id;
            this.name = name;
            this.password = password;
            this.role = role;
            this.createdDate = createdDate;
            this.email = email;
        }

        public int getId()
        {
            return id;
        }

        public void setId(int id)
        {
            this.id = id;
        }

        public String getName()
        {
            return name;
        }

        public void setName(String name)
        {
            this.name = name;
        }

        public String getPassword()
        {
            return password;
        }

        public void setPassword(String password)
        {
            this.password = password;
        }

        public int getRole()
        {
            return role;
        }

        public void setRole(int role)
        {
            this.role = role;
        }

        public String getCreatedDate()
        {
            return createdDate;
        }

        public void setCreatedDate(String createdDate)
        {
            this.createdDate = createdDate;
        }

        public String getEmail()
        {
            return email;
        }

        public void setEmail(String email)
        {
            this.email = email;
        }

        public override string ToString()
        {
            return "User{" + "id=" + id + ", name=" + name + ", password=" + password + ", role=" + role + ", createdDate=" + createdDate + ", email=" + email + '}';
        }
    }
}