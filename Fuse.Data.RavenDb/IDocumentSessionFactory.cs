﻿using Raven.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fuse.Data.RavenDb
{
    public interface IDocumentSessionFactory
    {
        IDocumentSession GetSession();
    }
}
