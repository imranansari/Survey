class SurveyViewController1 < UITableViewController
	include Extensions

	attr_accessor :selected_index

	def viewDidLoad
		super
		# changeNavigationBarBackButtonText
	end

	def tableView(tableView, didSelectRowAtIndexPath:indexPath)
		tableView.deselectRowAtIndexPath(indexPath, animated:true)

		if(@selected_index)
			path = NSIndexPath.indexPathForRow(@selected_index, inSection:0)
			cell = tableView.cellForRowAtIndexPath(path)
			cell.accessoryType = UITableViewCellAccessoryNone
		end

		@selected_index = indexPath.row
		cell = tableView.cellForRowAtIndexPath(indexPath)
		cell.accessoryType = UITableViewCellAccessoryCheckmark
		# self.delegate.didSelectGame(self, @game)
	end

	def prepareForSegue(segue, sender:sender)    
    if (segue.identifier == 'Question2')            
      surveyViewController2 = segue.destinationViewController
      surveyViewController2.delegate = self

      Survey.instance.answers[:q1] = @selected_index
    end
  end

  def goToHome(sender)
  	self.navigationController.popViewControllerAnimated(true)
  end


end