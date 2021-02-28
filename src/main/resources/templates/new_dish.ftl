<#import "parts/common.ftl" as c>
<@c.page>

    <div style="text-align: center;"><h1>Новое блюдо</h1></div>

    <div>
        <form method="post"  action="/new_dish/add">
            <div class="form-outline mb-4">
                <input type="text"  name="nameDish" class="form-control" />
                <label class="form-label" for="form4Example1">Название</label>
            </div>

            <div class="form-outline mb-4">
                <input type="text" name="description" class="form-control" />
                <label class="form-label" for="form4Example2">Описание</label>
            </div>

            <div class="form-outline mb-4">
                <input type="number"  name="price" class="form-control" />
                <label class="form-label" for="form4Example3">Цена</label>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Добавить</button>
        </form>
    </div>

</@c.page>


