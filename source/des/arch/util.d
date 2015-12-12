module des.arch.util;

import std.meta;

///
template staticFilter(alias F, T...)
{
    static if (T.length == 0)
    {
        alias staticFilter = AliasSeq!();
    }
    else static if (T.length == 1)
    {
        static if( F!(T[0]) )
            alias staticFilter = AliasSeq!(T[0]);
        else alias staticFilter = AliasSeq!();
    }
    else
    {
        alias staticFilter = AliasSeq!( staticFilter!(F, T[ 0  .. $/2]),
                                        staticFilter!(F, T[$/2 ..  $ ]) );
    }
}

