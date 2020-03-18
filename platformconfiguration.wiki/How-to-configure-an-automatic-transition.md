Created by Rob Worthington, last modified on Jul 25, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+an+automatic+transition) on 2018-12-13.

When configuring a workflow you can specify that a transition is automatic.  This means that as soon as the user clicks the button to save the last (or only) data object in the workflow process, the transition will take place.

### 1. Data object
The following is an example of the code used to configure a "**save**" button.  There are no changes from existing configuration.

Example:
```XML
                                            <layout id="buttonBar" orientation="horizontal" align="left">
                                                <button id="saveButton" type="app.save" assignName="$root">
                                                    <label>
                                                        <i18n xml:lang="pt">Enviar Para Revisão</i18n>
                                                        <i18n xml:lang="en">Submit For Review</i18n>
                                                        <i18n xml:lang="es">Enviar Para Revisão</i18n>
                                                        <i18n xml:lang="id">Simpan</i18n>
                                                        <i18n xml:lang="fr">Soumettre pour correction</i18n>
                                                    </label>
                                                </button>
                                                <button id="saveAsDraft" type="app.saveAsDraft" assignName="$root">
                                                    <label>
                                                        <i18n xml:lang="pt">Salvar como rascunho</i18n>
                                                        <i18n xml:lang="en">Save As Draft</i18n>
                                                        <i18n xml:lang="es">Guardar como borrador</i18n>
                                                        <i18n xml:lang="id">SaveAsDraft</i18n>
                                                        <i18n xml:lang="fr">Enregistrer comme brouillon</i18n>
                                                    </label>
                                                </button>
                                                <button id="validateButton" type="app.validateForm" assignName="$root">
                                                    <label>
                                                        <i18n xml:lang="pt">Formulário concluído com sucesso</i18n>
                                                        <i18n xml:lang="en">Form completed successfully</i18n>
                                                        <i18n xml:lang="es">Formulário concluído com sucesso</i18n>
                                                        <i18n xml:lang="id">✓</i18n>
                                                        <i18n xml:lang="fr">Formulaire rempli avec succès</i18n>
                                                    </label>
                                                </button>
                                            </layout>
```
### 2. Workflow configuration
In the workflow you must make a small change to the transition which you wish to automate.  Under the transition ID add the following line:

`"default": true`