<?php

if (!defined('AOWOW_REVISION'))
    die('illegal access');

if (!CLI)
    die('not in cli mode');


SqlGen::register(new class extends SetupScript
{
    protected $command = 'spelldifficulty';

    protected $tblDependencyTC = ['spelldifficulty_dbc'];
    protected $dbcSourceFiles  = ['spelldifficulty'];

    public function generate(array $ids = []) : bool
    {
        // has no unique keys..
        DB::Aowow()->query('TRUNCATE TABLE ?_spelldifficulty');

        DB::Aowow()->query('INSERT INTO ?_spelldifficulty SELECT * FROM dbc_spelldifficulty');

        $rows = DB::World()->select('SELECT DifficultySpellID_1, DifficultySpellID_2, DifficultySpellID_3, DifficultySpellID_4 FROM spelldifficulty_dbc');
        foreach ($rows as $r)
            DB::Aowow()->query('INSERT INTO ?_spelldifficulty VALUES (?a)', array_values($r));

        return true;
    }
});

?>
