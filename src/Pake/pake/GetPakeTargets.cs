using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;

namespace pake
{

    [Cmdlet("Get", "PakeTargets")]
    public class GetPakeTargets : PSCmdlet
    {
        //[Parameter]
        public string PakeFile { get; set; } = @".\pakefile.ps1";

        protected override void ProcessRecord()
        {
#if DEBUG
            var content = File.ReadAllText(@"..\..\..\..\..\..\pakefile.ps1");
#else
            var content = File.ReadAllText(base.SessionState.Path.Combine(base.SessionState.Path.CurrentLocation.Path, PakeFile));
#endif
            var (tokens, errors) = content.parse();
            var functions = tokens.functions();

            WriteObject(functions, true);
        }
    }

}
