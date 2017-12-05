class NoteMailer < ApplicationMailer
  default from: "imagerdbaddresssendonly20i7@gmail.com"
    
  def note_email(user, note)
    @note = note
    @title = note.title
    @product = note
    @user = user
    mail(
      to: note.user.email,
      cc: "imagerdbaddresssendonly20i7@gmail.com",
      subject: "案件",
    ) do |format|
      format.html
    end
  end
    
    
     
end
