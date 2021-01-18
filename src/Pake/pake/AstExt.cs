using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Management.Automation;

namespace pake
{
    public static class AstExt
    {
        public static IEnumerable<string> functions(this System.Management.Automation.Language.Token[] tokens)
        {
            bool captureFunctionName = false;

            foreach (var token in tokens)
            {
                if (captureFunctionName)
                {
                    yield return token.Text;
                    captureFunctionName = false;
                    continue;
                }

                if (token.Kind == System.Management.Automation.Language.TokenKind.Function)
                    captureFunctionName = true;
            }

            yield break;
        }

        public static (System.Management.Automation.Language.Token[], System.Management.Automation.Language.ParseError[]) parse(this string input)
        {
            System.Management.Automation.Language.Token[] tokens;
            System.Management.Automation.Language.ParseError[] errors;

            _ = System.Management.Automation.Language.Parser.ParseInput(input, out tokens, out errors);

            return (tokens, errors);
        }
    }

}
