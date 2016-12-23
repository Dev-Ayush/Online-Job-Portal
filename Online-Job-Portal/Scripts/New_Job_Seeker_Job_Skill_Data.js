function disableTextbox(_chechboxID) {
    var textBoxID = document.getElementById('employer_panel');
    var chechboxID = document.getElementById(_chechboxID);
    
    if (chechboxID.checked)
    {
        textBoxID.disabled = true;
    }
    else {
        textBoxID.disabled = false;
    }
}