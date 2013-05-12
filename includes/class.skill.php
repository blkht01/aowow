<?php

if (!defined('AOWOW_REVISION'))
    die('illegal access');


class SkillList extends BaseType
{
    public static function getName($id)
    {
        $n = DB::Aowow()->SelectRow('
            SELECT
                name_loc0,
                name_loc2,
                name_loc3,
                name_loc6,
                name_loc8
            FROM
                ?_skillLine
            WHERE
                id = ?d',
            $id
        );
        return Util::localizedString($n, 'name');
    }

    public function getListviewData() { }
    public function addGlobalsToJScript(&$refs) { }
    public function addRewardsToJScript(&$refs) { }
    public function renderTooltip() { }

}

?>
