﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sophist.Resources
{
    public class ResourceNotFoundException : Exception
    {
        public ResourceNotFoundException(string message)
            : base(message)
        {
        }
    }
}
