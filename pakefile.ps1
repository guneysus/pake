function foo () {	
	[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $_=[System.Windows.Forms.MessageBox]::Show("foo") 
}

function bar () {
	[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $_=[System.Windows.Forms.MessageBox]::Show("bar") 
}
