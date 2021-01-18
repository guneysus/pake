using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;
using System.Management.Automation.Internal;

namespace pake
{
    [Cmdlet("Show", "Pake")]
    [Alias("pake")]
    public class ShowPake : PSCmdlet
    {
        [Parameter(Position = 0)]
        public string Target
        {
            get;
            set;
        }

        protected override void ProcessRecord()
        {
            string exp = $".\\pakefile.ps1 && Run-Target {Target}";
            //var res = base.InvokeCommand.InvokeScript(exp);

            ScriptBlock scriptBlock = base.InvokeCommand.NewScriptBlock(exp);
            var res = scriptBlock.Invoke();

            base.ProcessRecord();
        }


    }

}
