using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;

namespace pake
{
    [Cmdlet("Show", "Pake")]
    [Alias("pake")]
    public class ShowPake : PSCmdlet
    {
        [Parameter(Position =0)]
        public string Target
        {
            get;
            set;
        }

        protected override void ProcessRecord()
        {
            //var content = File.ReadAllText(@"..\..\..\..\..\..\pakefile.ps1");
            //var (tokens, errors) = content.parse();
            //var functions = tokens.functions();

            //WriteObject(functions);
        }
    }

}
