﻿using System;
using System.Collections.Generic;
using System.Collections;

namespace Elixir.Data.Contracts
{   
    /// <summary>
    /// 
    /// </summary>
    public interface IFilter
    {
        /// <summary>
        /// Gets or sets the index of the page.
        /// </summary>
        /// <value>
        /// The page index.
        /// </value>
        int PageIndex { get; set; }

        /// <summary>
        /// Gets or sets the size of the page.
        /// </summary>
        /// <value>
        /// The size of the page.
        /// </value>
        int PageSize { get; set; }
        
        /// <summary>
        /// Gets or sets the params.
        /// </summary>
        /// <value>
        /// The params.
        /// </value>
        IDictionary<string, object> Params { get; set; }

        /// <summary>
        /// Gets or sets the order by.
        /// </summary>
        /// <value>
        /// The order by.
        /// </value>
        IDictionary<string, bool> OrderBy { get; set; }
    }
}
