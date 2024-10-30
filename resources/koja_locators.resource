*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource


*** Variables ***
# xpath=//svg[@id='koja-navigation-processpicture']
# xpath=//svg[@id='koja-navigation-processpicture']
${selector_koja_navigation_processpicture}
...                                                 xpath=/div[descendant::svg[contains(@class, 'koja-menuicon') and contains(@id, 'koja-navigation-processpicture')]]
${selector_koja_homescreenbg}                       xpath=//svg[@id='KojaLogoWhite_Layer_1']
${selector_koja_KOJA_TE01_M}                        xpath=//div[@koja-pointid='KOJA_TE01_M']
${selector_koja_alarmicon}                          xpath=//div[@id='koja-navigation-alarmicon-wrap']
${selector_koja_navigation_parameterlist}           xpath=//svg[@id='koja-navigation-parameterlist']
${selector_koja_navigation_configurationlist}       xpath=//svg[@id='koja-navigation-configurationlist']
