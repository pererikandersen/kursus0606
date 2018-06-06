pageextension 123456701 ResourceListExt extends "Resource List"
// CSD1.00 - 2018-01-01 - D. E. Veloper 
// Chapter 5 - Lab 1-3 
// Changed property on the Type field 
// Added new fields: 
// - Internal/External 
// - Maximum Participants 
// Added code to OnOpenPage trigger 
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("CSD_Resource Type"; "CSD_Resource Type")
            {

            }
            field("CSD_Maximum Participants"; "CSD_Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }
    trigger
    OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::machine));
        FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
}