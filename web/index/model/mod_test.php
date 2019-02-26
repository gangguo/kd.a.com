<?php

namespace app\model;

/**
 * Base model
 */
class mod_test extends mod_base
{
    public static function _init()
    {
        echo __method__."\n";
    }

    public static function test()
    {
        echo __method__."\n";
    }
}
