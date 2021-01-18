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
        protected override void BeginProcessing()
        {
#if DEBUG
            var content = File.ReadAllText(@"..\..\..\..\..\..\pakefile.ps1");
#else
            var content = File.ReadAllText(@".\pakefile.ps1");
#endif
            var (tokens, errors) = content.parse();
            var functions = tokens.functions();

            WriteObject(functions);
        }
        protected override void ProcessRecord()
        {

        }
    }

}
