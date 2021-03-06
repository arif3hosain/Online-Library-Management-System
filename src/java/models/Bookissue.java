package models;
// Generated Jun 23, 2015 12:50:21 AM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * Bookissue generated by hbm2java
 */
public class Bookissue  implements java.io.Serializable {


     private Integer issueId;
     private Book book;
     private Date issueDate;
     private Date dueDate;
     private String email;
     private String status;

    public Bookissue() {
    }

    public Bookissue(Book book, Date issueDate, Date dueDate, String email, String status) {
       this.book = book;
       this.issueDate = issueDate;
       this.dueDate = dueDate;
       this.email = email;
       this.status = status;
    }
   
    public Integer getIssueId() {
        return this.issueId;
    }
    
    public void setIssueId(Integer issueId) {
        this.issueId = issueId;
    }
    public Book getBook() {
        return this.book;
    }
    
    public void setBook(Book book) {
        this.book = book;
    }
    public Date getIssueDate() {
        return this.issueDate;
    }
    
    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }
    public Date getDueDate() {
        return this.dueDate;
    }
    
    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


