create trigger trigger_insert instead of insert on Quiz_taken_table
for each row
begin
    if (:new)
    insert Quiz_table
    where QuizId = :new.QuizId 
end;