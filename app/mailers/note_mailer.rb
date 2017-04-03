class NoteMailer < ApplicationMailer
  default from: 't.m4tsuok4@gmail.com'
    
  def note_email(user, note)
    @note = note
    @title = note.title
    mail to: "t.m4tsuok4@gmail.com"
  end
    
    
     
end
