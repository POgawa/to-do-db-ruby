require("spec_helper")

describe(Task) do
  describe('description') do
    it('creates a task object and gives it a description') do
      test_task = Task.new({description: 'Make a website'})
      test_task.save()
      expect(test_task.description()).to(eq('Make a website'))
    end
  end
end
