function build () {	
	[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $_=[System.Windows.Forms.MessageBox]::Show("build") 
}

function publish () {
	[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $_=[System.Windows.Forms.MessageBox]::Show("publish")
}
