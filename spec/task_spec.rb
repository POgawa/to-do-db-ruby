require("spec_helper")

describe(Task) do
  describe('description') do
    it('creates a task object and gives it a description') do
      test_task = Task.new({description: 'Make a website'})
      test_task.save()
      expect(test_task.description()).to(eq('Make a website'))
    end
  end


describe('clear') do
  it('clears out the table') do
    test_task = Task.new({description: 'Mow the lawn'})
    test_task.clear()
    expect(Task.all()).to(eq([]))
  end
end



describe("#==") do
   it("is the same task if it has the same description") do
     task1 = Task.new({:description => "learn SQL"})
     task2 = Task.new({:description => "learn SQL"})
     expect(task1).to(eq(task2))
   end
 end

 # describe('remove') do
 #   it('remove out of the database') do
 #     test_task = Task.new({description: 'Mow the lawn'})
 #     test_id = test_task.save().to_i
 #     expect(test_task.remove(test_id)).to(eq([]))
 #   end
 # end

 describe('remove') do
   it('clears out the table') do
     test_task = Task.new({description: 'Mow the lawn'})
     test_task.save()
     test_task2 = Task.new({description: 'Do your homework'})
     test_task2.save()
     test_task.remove()
     expect(Task.all()).to(eq([test_task2]))
   end
 end

end
